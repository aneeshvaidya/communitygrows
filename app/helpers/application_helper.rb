module ApplicationHelper
    
    def indented_render(num, *args)
        render(*args).gsub(/^/, "\t" * num)
    end
end
