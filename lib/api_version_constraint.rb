# frozen_string_literal: true

# ApiVersionConstraint
class ApiVersionConstraint
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    @default || req.headers['Accept'].include?("application/vnd.pdvend.v#{@version}")
  end
end
