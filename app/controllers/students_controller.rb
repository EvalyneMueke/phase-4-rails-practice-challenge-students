class StudentsController < ApplicationController
    def index
        render json: Student.all, each_serializer: StudentSerializer
    end

    def show
        student = Student.find(params[:id])
        render json: student, serializer: StudentSerializer
    end
    

    def create
        student = Student.create(student_params)
        if student
            render json: student, status: :created
        else
            render json: {error: student.errors}, status: :unprocessable_entity
        end

    end

    def update
        student = Student.find(params[:id])
        student.update(student_params)
        if student
            render json: student
        else
            render json: {error: student.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        student = Student.find(params[:id])
        student.destroy
    end
    private

    def student_params
      params.require(:student).permit(:name, :major, :age, :instructor_id)
    end
end
