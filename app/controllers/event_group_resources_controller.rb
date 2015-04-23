class EventGroupResourcesController < ApplicationController
  def index
    if params[:event_group_id]
      @event_group_resources = EventGroup.find(params[:event_group_id]).event_group_resources
    else
      @event_group_resources = []
    end

    respond_to do |format|
      format.json { render :json => { 
        :success => true,
        :message => "Loaded data",
        :data => @event_group_resources
      } }
    end
  end

  def create
    @event_group_resource = EventGroupResource.find_or_create_by_event_group_id_and_resource_id params[:event_group_id], params[:resource_id]
    @event_group_resource.project_ids = params[:project_ids]

    if params[:eg_resource_id]
      eg_resource = EventGroupResource.find params[:eg_resource_id]
      @event_group_resource.description = eg_resource.description;
      @event_group_resource.title = eg_resource.title;
    end

    respond_to do |format|
      if @event_group_resource.save
        format.json { render :json => { :success => true, :event_group_resources => [@event_group_resource] } }
      end
    end
  end

  def update
    @event_group_resource = EventGroupResource.find(params[:id])
    @event_group_resource.project_ids = params[:project_ids]

    if params[:url].present?
      @event_group_resource.resource.update_attribute :url, params[:url]
      @event_group_resource.url = params[:url]
    end

    respond_to do |format|
      if @event_group_resource.update_attributes(:title => params[:title], :description => params[:description], :category => params[:category])
        format.json { render :json => { :success => true, :event_group_resources => [@event_group_resource] } }
      end
    end
  end

  def destroy
    @event_group_resource = EventGroupResource.find(params[:id])
    @event_group_resource.destroy

    respond_to do |format|
      format.json { render :json => { :success => true } }
    end
  end
end
