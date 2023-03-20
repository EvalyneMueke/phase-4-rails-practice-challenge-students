class InstructorsController < ApplicationController
    def index 
    instructors = Instructor.all
    render json: instructors
    
    end

    def show
    instructor = Instructor.find(params[:id])
    render json: instructor, serializer: InstructorSerializer
    end

    def create
    instructor = Instructor.create(instructor_params)
    if instructor
        render json: instructor, status: :created
    else
       render json: {error: "Not created"}, status: :unprocessable_entity
    end 

    end

    def update
    instructor = Instructor.find(params[:id])

    if instructor.update(instructor_params)
        render json: instructor
    else
        render json: {error: "Not updated"}, status: :unprocessable_entity
    end

    end

    def destroy
        instructor = Instructor.find(params[:id])
        instructor.destroy
      end

    private

    def instructor_params
        params.require(:instructor).permit(:name)
      end

end
