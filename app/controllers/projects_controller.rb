class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_projects

    def index
        render json: current_user.projects
        # render json:Project.all
    end


    def show
        puts "-----------"
        puts project_id_param
        puts "-----------"
        project = @projects.find(params[:id])
        render json: project
    end


    # POST /projects
    def create
        render json: current_user.projects.create(project_params)
    end

    # PATCH/PUT /projects/1
    def update
        project = @projects.find(params[:id])
        if project.update(project_params)
            render json: project
        else
            render json: project.errors, status: :unprocessable_entity
        end
    end

    # DELETE /projects/1
    def destroy
        @project.destroy
    end

    private
    def set_projects
       @projects = current_user.projects
    end

    def project_id_param
        return params.fetch(:projectId, nil)
    end
    
    # Only allow a trusted parameter "white list" through.
    def project_params
        dataParam = params.fetch(:data, "")
        nameParam = params.fetch(:name, "")
        
        return {data: dataParam, name: nameParam}
    end
    
end
