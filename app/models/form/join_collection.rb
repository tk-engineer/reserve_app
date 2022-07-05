class Form::JoinCollection < Form::Base
  # FORM_COUNT = 10
  attr_accessor :joins

  def initialize(num)
    # super attributes
    self.joins = num.times.map { Join.new() }
  end

  def joins_attributes=(attributes)
    self.joins = attributes.map { |_, v| Join.new(v) }
  end

  def update
    Join.transaction do
      self.joins.map do |join|
        join.update
      end
    end
  end
end
