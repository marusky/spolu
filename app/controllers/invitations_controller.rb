class InvitationsController < Devise::InvitationsController

  def new
    @team = Team.find(params[:team_id].to_i)
    super
  end

  def create
    if current_user.can_invite_to_team?(7)
      super
      @user.teams << ::Team.first
    else
      render :new
    end
  end
end