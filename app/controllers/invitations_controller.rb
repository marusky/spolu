class InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters

  def new
    return redirect_to root_path, notice: 'Nemozes pridavat do tohto timu!' unless current_user.can_manage_team?(params[:team_id])

    @team = Team.find(params[:team_id])
    super
  end

  def create
    render :new unless current_user.can_manage_team?(params[:team_id])

    user = User.find_by(email: params[:email])
    team = Team.find_by(id: params[:team_id])

    user ||= User.invite!(email: params[:email])

    team.invited_users << user

    redirect_to team
  end

  protected

  # Permit the new params here.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: %i[first_name last_name])
  end
end