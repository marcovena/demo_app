module ApplicationHelper
def full_title(page_title)
base="Ruby on RAILS TUTORIAL"
full_title = page_title.empty? ? base : "#{base} | #{page_title}"
end
end
