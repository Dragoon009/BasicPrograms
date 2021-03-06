class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end

  def new
  	@project = Project.new
    @skill = Skill.all
  end
    
  def create
  	@project = Project.new(project_params)
  	if @project.save
      redirect_to :action => 'new'
    else
      flash[:error] =  @project.errors.full_messages.join(', ')
      redirect_to :action => 'new'
    end
  end

	def edit
  	@project = Project.find(params[:id])
    @skill = Skill.all
	end
  def update
  	@project = Project.find(params[:id])
  	if @project.update(project_params)
  		redirect_to @project
  	else
  		render 'edit'
  	end
 	end
 
  def show
  	@project = Project.find(params[:id])	
  end

  def destroy
    Project.find(params[:id]).destroy
   flash[:success] = "User deleted"
    redirect_to projects_url
  end

  private
  def project_params
    params.require(:project).permit(:name, :start_date, :completion_date,:skill_ids => [])
  end	

end
