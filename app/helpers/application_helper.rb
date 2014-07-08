module ApplicationHelper

 def needs_sidepanel?
   current_page?(root_path) || current_page?(who_am_i_path) || current_page?(what_do_i_offer_path) || current_page?(contacted_path) 
 end

 def current_user_admin?
   user_signed_in? && current_user.admin?  
 end
 
 def title(page_title)
    content_for(:title) { page_title }
  end

end
