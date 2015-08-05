# OmniAuth::Crest

This gem provides the [EVE Online](http://www.eveonline.com)/CREST strategy for [OmniAuth](https://github.com/intridea/omniauth).

This allows your users to authenticate themselves via their EVE Online Account.

## Usage

Include the gem in your Gemfile:

```ruby
gem 'omniauth-crest'
```

Once the gem is installed, you need to add the middleware.

```ruby
# Rails:
# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :crest, 'client_id', 'secret_key'
end

# OR

# Rack
use OmniAuth::Builder do
  provider :crest, 'client_id', 'secret_key'
end
```

Put in your Client ID and Secret Key of course. You can get them from https://developers.eveonline.com/applications

For more information on OmniAuth see [the OmniAuth Wiki](https://github.com/intridea/omniauth/wiki).


## COPYRIGHT NOTICE
EVE Online and the EVE logo are the registered trademarks of CCP hf. All rights are reserved worldwide. All other trademarks are the property of their respective owners. EVE Online, the EVE logo, EVE and all associated logos and designs are the intellectual property of CCP hf. All artwork, screenshots, characters, vehicles, storylines, world facts or other recognizable features of the intellectual property relating to these trademarks are likewise the intellectual property of CCP hf. CCP hf. has granted permission to Manuel Hutter to use EVE Online and all associated logos and designs for promotional and information purposes on its website but does not endorse, and is not in any way affiliated with, Manuel Hutter. CCP is in no way responsible for the content on or functioning of this website, nor can it be liable for any damage arising from the use of this website.
