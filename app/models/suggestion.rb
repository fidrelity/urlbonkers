class Suggestion < ActiveRecord::Base

  PREFIXES = %w(uber extra pro up evo mega boom)
  SUFFFIXES = %w(app star net crew wiki box)
  TLD = ".com"

  attr_accessor :result

  validates :buzzword, presence: true

  def result
    while result_unavailable?
      @result = build_fqdn
    end
    @result
  end

  private

  def result_unavailable?
    return true unless @result
    !Whois.whois(@result).available?
  end

  def build_fqdn
    random_prefix + Rack::Utils.escape(buzzword.gsub(/\s+/, "")) + random_suffix
  end

  def random_prefix
    PREFIXES.sample
  end

  def random_suffix
    SUFFFIXES.sample + TLD
  end
end
