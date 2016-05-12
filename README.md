# OmniAuth::Crest

This gem provides the [EVE Online](http://www.eveonline.com)/CREST strategy for [OmniAuth](https://github.com/intridea/omniauth).

This allows your users to authenticate themselves via their EVE Online **Character**.

auth_hash example:

```ruby
{
  "provider" => "crest",
  "uid" => 1337,
  "info" => {
    "name" => "Foo Bar",
    "character_id" => 1337,
    "expires_on" => "2015-08-05T07:02:55",
    "scopes" => "",
    "token_type" => "Character",
    "character_owner_hash" => "b4d455="
  },
  "credentials" => {
    "token" => "...",
    "expires_at" => 1438758175,
    "expires" => true
  },
  "extra" => {
    "raw_info" => {
      "CharacterID" => 1337,
      "CharacterName" => "Foo Bar",
      "ExpiresOn" => "2015-08-05T07:02:55",
      "Scopes" => "",
      "TokenType" => "Character",
      "CharacterOwnerHash" => "b4d455="
    }
  }
}
```

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

## Scopes & Authenticated CREST

If you wish to define app-wide scopes for authenticated CREST, add a scope
parameter to the middleware:

```ruby
# Rails:
# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :crest, 'client_id', 'secret_key',
    scope: 'publicData characterLocationRead'
end

# OR

# Rack
use OmniAuth::Builder do
  provider :crest, 'client_id', 'secret_key',
    scope: 'publicData characterLocationRead'
end
```

### Possible Scopes

As of `2016-05-12`:

* __characterAccountRead__: Read your account subscription status.
* __characterAssetsRead__: Read your asset list.
* __characterBookmarksRead__: List your bookmarks and their coordinates.
* __characterCalendarRead__: Read your calendar events and attendees.
* __characterChatChannelsRead__: List chat channels you own or operate.
* __characterClonesRead__: List your jump clones, implants, attributes, and jump
  fatigue timer.
* __characterContactsRead__: Allows access to reading your characters contacts.
* __characterContactsWrite__: Allows applications to add, modify, and delete
  contacts for your character.
* __characterContractsRead__: Read your contracts.
* __characterFactionalWarfareRead__: Read your factional warfare statistics.
* __characterFittingsRead__: Allows an application to view all of your
  character's saved fits.
* __characterFittingsWrite__: Allows an application to create and delete the
  saved fits for your character.
* __characterIndustryJobsRead__: List your industry jobs.
* __characterKillsRead__: Read your kill mails.
* __characterLocationRead__: Allows an application to read your characters real
  time location in EVE.
* __characterLoyaltyPointsRead__: List loyalty points your character has for the
  different corporations.
* __characterMailRead__: Read your EVE Mail.
* __characterMarketOrdersRead__: Read your market orders.
* __characterMedalsRead__: List your public and private medals.
* __characterNavigationWrite__: Allows an application to set your ships
  autopilot destination.
* __characterNotificationsRead__: Receive in-game notifications.
* __characterOpportunitiesRead__: List the opportunities your character has
  completed.
* __characterResearchRead__: List your research agents working for you and
  research progress.
* __characterSkillsRead__: Read your skills and skill queue.
* __characterStatsRead__: Yearly aggregated stats about your character.
* __characterWalletRead__: Read your wallet status, transaction, and journal
  history.
* __corporationAssetRead__: Read your corporation's asset list.
* __corporationBookmarksRead__: List your corporation's bookmarks and their
  coordinates.
* __corporationContractsRead__: List your corporation's contracts.
* __corporationFactionalWarfareRead__: Read your corporation's factional warfare
  statistics.
* __corporationIndustryJobsRead__: List your corporation's industry jobs.
* __corporationKillsRead__: Read your corporation's kill mails.
* __corporationMarketOrdersRead__: List your corporation's market orders.
* __corporationMedalsRead__: List your corporation's issued medals.
* __corporationMembersRead__: List your corporation's members, their titles, and
  roles.
* __corporationShareholdersRead__: List your corporation's shareholders and
  their shares.
* __corporationStructuresRead__: List your corporation's structures, outposts,
  and starbases.
* __corporationWalletRead__: Read your corporation's wallet status, transaction,
  and journal history.
* __fleetRead__: Allows real time reading of your fleet information (members,
  ship types, etc.) if you're the boss of the fleet.
* __fleetWrite__: Allows the ability to invite, kick, and update fleet
  information if you're the boss of the fleet.
* __publicData__: Allows access to public data.
* __structureVulnUpdate__: Allows updating your structures' vulnerability
  timers.

### Per-Request Options

If you want to define the scope on a per-request basis, you can pass it to the
OmniAuth request phase URL, for example:
`/auth/crest?scope=publicData+characterLocationRead`


## Questions

Ask me on Twitter at [@dratir](https://twitter.com/dratir).

## Contribute

If you find a Bug or have a feature suggestion, please [open an Issue on GitHub](https://github.com/mhutter/omniauth-crest/issues/new).


## COPYRIGHT NOTICE
EVE Online and the EVE logo are the registered trademarks of CCP hf. All rights are reserved worldwide. All other trademarks are the property of their respective owners. EVE Online, the EVE logo, EVE and all associated logos and designs are the intellectual property of CCP hf. All artwork, screenshots, characters, vehicles, storylines, world facts or other recognizable features of the intellectual property relating to these trademarks are likewise the intellectual property of CCP hf. CCP hf. has granted permission to Manuel Hutter to use EVE Online and all associated logos and designs for promotional and information purposes on its website but does not endorse, and is not in any way affiliated with, Manuel Hutter. CCP is in no way responsible for the content on or functioning of this website, nor can it be liable for any damage arising from the use of this website.
