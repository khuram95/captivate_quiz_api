# require 'byebug'
class QuestionsController < ApplicationController
  def index
    render json: Question.all.order(name: :asc)
  end

  def create
    question = Question.find_or_initialize_by(name: params[:name])

    if params[:thumbup].present?
      question.update! thumbup: question.thumbup + 1
    end

    if params[:thumbdown].present?
      question.update! thumbdown: question.thumbdown + 1
    end

    render json: question
  end

  def admin_update
    question = Question.find_by(name: params[:name])
    return render json: { error: "question not found by this name #{params[:name]}" } if question.blank?

    if params[:thumbup].present?
      question.update! thumbup: params[:thumbup]
    end

    if params[:thumbdown].present?
      question.update! thumbdown: params[:thumbdown]
    end

    render json: question
  end
end

# http://localhost:3000/questions/admin_update?name=question1&thumbup=15
# http://localhost:3000/questions/admin_update?name=question1&thumbdown=15
# http://localhost:3000/questions?name=question1&thumbdown=1
# http://localhost:3000/questions?name=question1&thumbup=1