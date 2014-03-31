class ProfilesViewerController < ViewOnlineController
  include Permissions

  ProjectsCoordinator

  prepend_before_filter :set_view_permissions # run this before any permissions
  prepend_before_filter :get_profile # prepend so that QE methods don't fail
  prepend_before_filter :set_user # run this before set_view_permissions since permissions depend on user
  before_filter :ensure_permission, :only => [ :entire, :summary ]
  before_filter :set_references

  def set_custom_folder
    @custom_folder = 'readonly'
  end

  def bulk_summary_forms
    @page_title = "Acceptance Summary Forms"

    params[:summary] = true
    bulk_acceptance_forms([ :appln, { :viewer => :persons } ]) do |acc|
      @instances << { :instance => acc.appln,
        :appln => acc.appln,
        :title => "#{acc.viewer.name} Summary Form"
      }
    end
  end

  def submit
    flash[:notice] = "Sorry, only students can submit applications.  If you need to change an applications status, you can do it with the move/withdraw link if you have sufficient access permissions.  If you don't, email the contact email and you should be a ble to."
    redirect_to :back
  end

  def show
    # go somewhere appropriate
    redirect_to @can_view_entire ? 
      entire_profiles_viewer_url(@profile) : summary_profiles_viewer_url(@profile)
  end

  def entire
    @debug = @can_view_references.inspect
    @submenu_title = 'View Appln'
    index
  end

  def summary
    @submenu_title = 'View Appln Summary'
    index
  end

  def delete_reference
    flash[:error] = "Sorry, only the student can delete references.  If you really want this done, email the technical inquiries email below."
    redirect_to :back
  end

  # explain withdrawing should be done with admin options
  def withdraw
    render :inline => %|
<html>
Sorry, this link only works for students.  If you need to withdraw an application, you can do so with the move/withdraw link on your projects if you have sufficient permissions; if not, contact #{$tech_email_only}.
<A HREF="javascript:history.go(-1)>Back</A>
</html>
|
  end

  protected

    def ensure_permission
      unless instance_variable_get("@can_view_#{params[:action]}")
        flash[:notice] = "Sorry, you don't have permission for this action."
        redirect_after_denied
      end
    end

    ### questionnaire methods
  
    def get_filter
      referrer_action = request.referer.split('/').last
      if (%w(summary bulk_summary_forms).include?(params[:action])) || 
        (referrer_action && %w(summary bulk_summary_forms).include?(referrer_action))
        { :filter => [ "in_summary_view" ], :default => false }
      elsif %w(entire).include? params[:action]
        if @can_view_confidential
          nil
        else
          { :filter => ['confidential'], :default => true }
        end
      end
    end

    def questionnaire_instance
      @instance = @profile.appln
    end

    def get_questionnaire
      unless @profile.appln && @profile.appln.form
        render :inline => "Error: Couldn't find application for profile #{@profile.id}.  This might be because the profile was created manually without an application.  If there should be an application, email us at #{$tech_email_only}."
      else
        @questionnaire = @profile.appln.form.questionnaire
      end
    end

    ### end questionnaire methods
end 
