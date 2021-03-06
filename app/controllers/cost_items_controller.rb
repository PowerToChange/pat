class CostItemsController < ApplicationController
  before_filter :set_menu_titles
  before_filter :set_project_access_list
  before_filter :get_cost_item, :only => [ :show, :set_applies_to, :set_optional, :destroy, :edit, :update, 
    :set_cost_item_amount, :set_cost_item_description, :set_locked ]
  before_filter :check_permission, :only => [ :set_cost_item_amount, :set_cost_item_description ]
  in_place_edit_for :cost_item, :description
  in_place_edit_for :cost_item, :amount
	
  def index
    list
    render :action => 'list'
  end 

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @cost_items = @eg.cost_items
    @cost_items.delete_if{ |ci| ci.class == ProfileCostItem }
    # get rid of cost items for projects that don't exist any more
    @cost_items.delete_if{ |ci| ci.class == ProjectCostItem && (begin ci.project.nil? rescue true end) }
    @cost_items.sort!
    
    @just_modified_id = @cost_item.id if @cost_item
    @just_modified_id ||= flash[:just_modified_id]
  end

  def set_optional
    if (@cost_item.class == YearCostItem && @project_access.rassoc('all').nil?) || 
      (@cost_item.class == ProjectCostItem && @project_access.rassoc(@cost_item.try(:project_id)).nil?)
      render :inline => 'No access to change optional flag'
      return
    end

    @cost_item.optional = params[:cost_item_optional] == '1'
    @cost_item.save!
  end

  def set_locked
    if (@cost_item.class == YearCostItem && @project_access.rassoc('all').nil?) || 
      (@cost_item.class == ProjectCostItem && @project_access.rassoc(@cost_item.try(:project_id)).nil?)
      render :inline => 'No access to change optional flag'
      return
    end

    @cost_item.locked = params[:locked_optional] == '1'
    @cost_item.save!
  end

  def set_applies_to
    case params[:value]
    when 'all'
      if @project_access.rassoc('all').nil?
        render :inline => 'No access to change type to all.'
        return
      else
        @cost_item[:type] = 'YearCostItem'
      end
    else
      project_id = params[:value].to_i
      if @project_access.rassoc(project_id).nil?
        render :inline => 'No access to that project.'
        return
      else
        @cost_item.project_id = project_id
        @cost_item[:type] = 'ProjectCostItem'
      end
    end
    @cost_item.save!
    list
    render :partial => 'list'
  end

  def create
    params[:cost_item] ||= { }
    if params[:profile_id]
      params[:cost_item][:type]       ||= 'ProfileCostItem'
      params[:cost_item][:profile_id] ||= (params[:profile_id] || params[:acceptance_id])
    elsif @viewer.is_eventgroup_coordinator?(@eg)
      params[:cost_item][:type] ||= 'YearCostItem'
    elsif !@project_access.empty?
      params[:cost_item][:type]       ||= 'ProjectCostItem'
      params[:cost_item][:project_id] ||= @project_access[0][1]
    else
      render :inline => "No access to create a new cost-item."
      return
    end
    params[:cost_item][:event_group_id] = session[:event_group_id]
    params[:cost_item][:description]  ||= 'new item'
    params[:cost_item][:amount]       ||= 0.00
    
    @cost_item = params[:cost_item][:type].constantize.new(params[:cost_item])
    if @cost_item.save
      flash[:notice] = 'CostItem was successfully created.'
      list
    else
      render :action => 'new'
    end
  end

  def destroy
    @cost_item.destroy
    list
    render :action => '_list'
  end

    protected

    def set_menu_titles() @page_title = 'Manage Projects'; @submenu_title = 'costing' end

    def set_project_access_list
      current_projects = @eg.projects
      @project_access = current_projects.collect { |p|
        if @viewer.is_eventgroup_coordinator?(@eg) || (@viewer.set_project(p) &&
            (@viewer.is_project_administrator? || @viewer.is_project_director?))
          p
        else
          nil
        end
      }.compact.collect { |p| [ p.title, p.id ] }
      
      # only eventgroup coordinator can set yearly cost items
      all_item = [ @eg.title, 'all' ]
      @project_access << all_item if @viewer.is_eventgroup_coordinator?(@eg)
      @project_access.sort! { |a,b| a[0] <=> b[0] }

      # create @project_titles, also include the all item so that this text can be displayed even
      # if the user doesn't have permissions to edit
      @project_titles = current_projects.collect{|p| [p.title, p.id]} << all_item
    end

    def get_cost_item
      @cost_item = CostItem.find(params[:id])
    end

    def check_permission
      if (@cost_item.class == YearCostItem && @project_access.rassoc('all').nil?) || 
        (@cost_item.class == ProjectCostItem && @project_access.rassoc(@cost_item.try(:project_id)).nil?)
        render :inline => 'No access'
        return
      end
    end
end
