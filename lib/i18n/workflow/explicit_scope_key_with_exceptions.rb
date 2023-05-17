# Module to add a _scope to each scope
module I18n::Workflow::ExplicitScopeKeyWithExceptions
  def lookup(locale, key, scope = [], options = {})
    scope = I18n.normalize_keys(nil, key, scope, options[:separator] || I18n.default_separator)
    scope = scope[1..] if scope.first.nil?
    key = scope.pop

    # ignore faker translations, faker gem does not support scopes
    # ignore unauthorized, cancancan and scopes dose not work correctly
    # will paginate does not support scope
    scope = scope.map { |s| "#{s}_scope".to_sym } unless [:faker, :unauthorized, :will_paginate, :devise, :errors].include?(scope.first)

    super(locale, key, scope, options)
  end
end
