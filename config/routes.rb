CV_PDF_URI ||= '/marat-saytakov-cv.pdf'

Rails.application.routes.draw do

  root 'welcome#index'

  # CV
  get '/marat-saytakov-resume.pdf', to: redirect(CV_PDF_URI)
  get '/cv.pdf', to: redirect(CV_PDF_URI)
  get '/cv', to: redirect(CV_PDF_URI)

  # Auth-based sync map data with Tripster
  get '@sync', to: 'welcome#sync'

  # Mauth
  get 'mauth', to: 'mauth#index'
  get 'mauth/privacy-policy', to: 'mauth#privacy_policy'

  # Stars
  get 'stars', to: 'stars#index'
  get 'stars/privacy-policy', to: 'stars#privacy_policy'

  get 'https://m4rr.ru/uzel/klevo!/l9pis/', to: redirect('https://blog.m4rr.ru/all/tekst-pesni-ramonki/')

end
