module UiHelper
  def defer_javascript_include_tag(file)
    file << ".js" unless file.to_s.end_with?(".js")
    render "shared/defer_js", file: file
  end
end
