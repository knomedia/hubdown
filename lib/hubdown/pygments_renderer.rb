require 'pygments'

class PygmentsRenderer < Redcarpet::Render::HTML

  def block_code(code, language)
    Pygments.highlight(code, :lexer => language)
  end

end
