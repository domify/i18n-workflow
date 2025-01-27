# Module to make cascading in translations the default option
module I18n::Workflow::AlwaysCascadeWithExceptions
  def lookup(locale, key, scope = [], options = {})
    
    # :unauthorized is cancancan scope, cascade caused tricky issues
    options = options.merge(cascade: true) unless [:unauthorized].include?(scope.is_a?(Array) ? scope&.first : scope)

    super(locale, key, scope, options)
  end
end
