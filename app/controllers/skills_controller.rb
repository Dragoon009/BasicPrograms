class SkillsController < ApplicationController
  def new
  	@skill = Skill.new
    @user = User.all
    @project = Project.all
  end

  def edit
    @skill = Skill.find(params[:id])
    @user = User.all
    @project = Project.all
  end

  
  def create
    @skill = Skill.new(skill_params)
    if @skill.save
    else
      render 'new'
    end
    
  end

  def index
    @skill = Skill.all
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      redirect_to @skill
    else
      render 'edit'
    end
  end
 
  def show
    @skill = Skill.find(params[:id])  
  end

  def destroy
   Skill.find(params[:id]).destroy
   flash[:success] = "User deleted"
   redirect_to skills_url
  end

  private
    def skill_params
      params.require(:skill).permit(:skill, :user_ids => [], :project_ids => [])
    end
end