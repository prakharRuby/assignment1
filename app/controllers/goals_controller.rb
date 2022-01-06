class GoalsController < ApplicationController

    def goals
        goal= Goal.all
        render json: goal, status: :created
    end
    def create_goal
        goal = Goal.create(description:params[:description], amount:params[:amount], goal_target_time:params[:goal_target_time].to_datetime )
        render json: goal, status: :created
    end
    def update_goal
        goal = Goal.find(params[:id])
        goal.update(description:params[:description], amount:params[:amount], goal_target_time:params[:goal_target_time].to_datetime )
        render json: goal, status: :created
    end
end
