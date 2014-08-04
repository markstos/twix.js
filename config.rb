activate :livereload

page "/" do
  @tab = "home"
end

page "/docs*" do
  @tab = "docs"
end

#use this instead of the redcarpet/syntax plugins so that we can do partials correctly
class SyntaxRender < Redcarpet::Render::HTML
  def initialize
    super(with_toc_data: true)
  end

  def block_code(code, language)
    lexer = Rouge::Lexer.find_fancy(language, code) || Rouge::Lexers::PlainText
    formatter = Rouge::Formatters::HTML.new(css_class: "#{lexer.tag} highlight")
    formatter.format(lexer.lex(code))
  end
end

helpers do
  def toc(file)
    content = File.read("source/#{file}")
    toc_renderer = Redcarpet::Render::HTML_TOC.new
    markdown = Redcarpet::Markdown.new(toc_renderer)
    markdown.render(content)
  end

  def markdown_partial(file)
    content = File.read("source/#{file}")
    renderer = SyntaxRender.new
    markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true, smartypants: true)
    markdown.render(content)
  end
end

ready do
  sprockets.append_path "vendor/stylesheets"
  sprockets.append_path "vendor/javascripts"
end
