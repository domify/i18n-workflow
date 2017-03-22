# Module to add a _scope to each scope
module I18n::Workflow::ExplicitScopeKeyWithExceptions
  def lookup(locale, key, scope = [], options = {})
    scope = I18n.normalize_keys(nil, key, scope, options[:separator] || I18n.default_separator)
    key = scope.pop

    # ignore faker translations, faker gem does not support scopes
    scope = scope.map { |s| "#{s}_scope".to_sym } unless [:faker].include?(scope.first)

    super(locale, key, scope, options.merge(cascade: true))
  end
end
