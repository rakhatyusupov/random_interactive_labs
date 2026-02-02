class HomeController < ApplicationController
  def index
    @cases = Article.published.order(published_at: :desc).limit(6)
    @articles = Article.published.order(published_at: :desc).limit(6)
    
    # Mock events data (you can replace this with actual event model later)
    @events = [
      {
        title: "Luxury Interior Design Summit",
        description: "An exclusive gathering of top designers, architects, and industry leaders to explore the latest trends and innovations in luxury interior design.",
        image: "https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800",
        attendees: "300",
        location: "Tech Hub Arena, Austin",
        date: "August 10, 2025",
        url: "#"
      },
      {
        title: "Luxury Interior Design Summit",
        description: "An exclusive gathering of top designers, architects, and industry leaders to explore the latest trends and innovations in luxury interior design.",
        image: "https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800",
        attendees: "300",
        location: "Tech Hub Arena, Austin",
        date: "August 10, 2025",
        url: "#"
      },
      {
        title: "Luxury Interior Design Summit",
        description: "An exclusive gathering of top designers, architects, and industry leaders to explore the latest trends and innovations in luxury interior design.",
        image: "https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800",
        attendees: "300",
        location: "Tech Hub Arena, Austin",
        date: "August 10, 2025",
        url: "#"
      },
      {
        title: "Luxury Interior Design Summit",
        description: "An exclusive gathering of top designers, architects, and industry leaders to explore the latest trends and innovations in luxury interior design.",
        image: "https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800",
        attendees: "300",
        location: "Tech Hub Arena, Austin",
        date: "August 10, 2025",
        url: "#"
      },
      {
        title: "Luxury Interior Design Summit",
        description: "An exclusive gathering of top designers, architects, and industry leaders to explore the latest trends and innovations in luxury interior design.",
        image: "https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800",
        attendees: "300",
        location: "Tech Hub Arena, Austin",
        date: "August 10, 2025",
        url: "#"
      },
      {
        title: "Luxury Interior Design Summit",
        description: "An exclusive gathering of top designers, architects, and industry leaders to explore the latest trends and innovations in luxury interior design.",
        image: "https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800",
        attendees: "300",
        location: "Tech Hub Arena, Austin",
        date: "August 10, 2025",
        url: "#"
      }
    ]
  end
end
