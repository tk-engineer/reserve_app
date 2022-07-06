class HomesController < ApplicationController
  def top
    @practices = Practice.all
    @members = Member.all
    @places = Place.all
    @joins = []
    # for i in 1..@practices.length do
    @practices.each do |practice|
      @joins.push(Join.where(practice_id: practice.id).order(member_id: :asc))
    end
  end

  def edit
    @practices = Practice.all
    @member = Member.find(params[:id])
    @places = Place.all
    @joins = Join.where(member_id: params[:id])
    # @joins = Form::JoinCollection.new
    # @form = Form::JoinCollection.new(@practices.length)
  end

  def update
    # @form = Form::JoinCollection.new(join_params)
    join = Join.where(member_id: params[:id], practice_id: params[:practice_id])
    join.update(join_params)
    # joins = join_params.map do |id, join_param|
      # join = Join.where(member_id: params[:id], practice_id: id)
    # join.update
    # end
    redirect_to "/top"
  end

  def new
    @practice = Practice.new
  end

  def create
    practice = Practice.new(practice_params)
    practice.save
puts "開始"
puts practice.id
puts "終了"
    members = Member.all
    members.each do |member|
      join = Join.new(practice_id: practice.id, member_id: member.id, flag: 9)
      join.save
    end
    redirect_to "/top"
  end

  def flag_display(flag)
    if flag == 1
      return "◯"
    elsif flag == 0
      return "×"
    elsif flag == 2
      return "△"
    else
      return "-"
    end
  end

  helper_method :flag_display

  private
  def join_params
    params.require(:join).permit(:flag)
  end

  def practice_params
    params.require(:practice).permit(:spot, :date, :start, :end)
  end

  def default_join_params
    params.require(:practice).permit(:spot)
  end
end
