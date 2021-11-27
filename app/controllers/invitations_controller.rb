class InvitationsController < Devise::InvitationsController

  def new
    return redirect_to root_path, notice: 'Nemozes pridavat do tohto timu!' unless current_user.can_invite_to_team?(params[:team_id])

    @team = Team.find(params[:team_id])
    super
  end

  def create
    render :new unless current_user.can_invite_to_team?(params[:team_id])

    user = User.find_by(email: params[:email])
    team = Team.find_by(id: params[:team_id])

    user ||= User.invite!(email: params[:email])

    team.invited_users << user

    redirect_to team
  end
end