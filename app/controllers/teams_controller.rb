class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  # before_action :show_favourite_team, only: [:index]
  before_action :authenticate_user!, only: [:index]

  def index
    @teams = current_user.teams
  end

  def home_team
    return redirect_to teams_path if current_user.home_team.nil?

    @team = Team.find(current_user.home_team)
    render :show
  end

  def show_teams
    respond_to do |format|
      format.js
    end
  end

  def show
    return redirect_to root_path, notice: 'Nemozes obzerat tento tim!' unless current_user.can_manage_team?(params[:id])

    if current_user.home_team.nil?
      current_user.home_team = params[:id]
      current_user.save!
    end
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new(team_params)
    @team.leader = current_user
    @team.members << current_user

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: "Team was successfully created." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: "Team was successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :description)
  end

  def show_favourite_team
    redirect_to team_path(6) if true
  end
end
