# Layer Zero - Social Publishing Platform

A Rails 8 application for user-generated articles, collections, and editorial workflow with social features.

## Features Implemented

### 1. User Authentication & Registration ✅

- Devise integration for authentication
- User profiles with:
  - Username, bio, avatar
  - Company and position
  - Social media links (Twitter, LinkedIn, GitHub, Instagram)
  - Website link
  - Registration date

### 2. Articles (WYSIWYG Editor) ✅

- Rich text editing with ActionText (Trix editor)
- Cover image upload
- Tag system
- Editorial workflow:
  - **Draft**: Author's working copy
  - **Submitted**: Submitted for editorial review
  - **Published**: Approved and public
- Slug generation from title
- Author attribution
- Public article listing (published only)

### 3. Collections (Are.na Style) ✅

- Create collections to group items
- Collection items support:
  - **Links**: URL with title
  - **Text**: Text content
  - **Images**: Upload images
  - **Documents**: Upload files
  - **Files**: General file uploads
- Drag-and-drop ordering (via position field)
- Cover image for collections
- Tag system
- Description field

### 4. Editorial Workflow ✅

- Admin dashboard (`/admin`)
- Pending review queue
- Approve & publish articles
- Unpublish articles
- Admin can edit any article

### 5. Tagging System ✅

- Gutentag gem integration
- Tags for both Articles and Collections
- Comma-separated tag input
- Tag display on cards and detail pages

### 6. User Profiles ✅

- Profile URL: `/@username`
- Display:
  - Avatar, bio, company, position
  - Social media links
  - Follower/following counts
  - Published articles
  - Public collections
- Follow/unfollow functionality

### 7. Follow/Subscription System ✅

- Users can follow other users
- Follower and following lists
- Custom Follow model (Rails 8 compatible)

## Tech Stack

- **Rails**: 8.1.2
- **Ruby**: 4.0
- **Database**: SQLite3
- **Authentication**: Devise
- **Authorization**: Pundit
- **Rich Text**: ActionText (built-in)
- **File Uploads**: ActiveStorage (built-in)
- **Tagging**: Gutentag
- **Frontend**: Turbo, Stimulus, Importmap

## Installation & Setup

```bash
# Install dependencies
bundle install

# Setup database
rails db:create db:migrate db:seed

# Start server
rails server
```

Visit http://localhost:3000

## Test Accounts

After running `rails db:seed`, you can log in with:

- **Admin**: admin@example.com / password
- **User 1**: john@example.com / password
- **User 2**: jane@example.com / password

## Routes

### Public Routes

- `GET /` - Article listing (homepage)
- `GET /articles` - All published articles
- `GET /articles/:id` - Article detail
- `GET /collections` - All collections
- `GET /collections/:id` - Collection detail with items
- `GET /@:username` - User profile

### Authenticated Routes

- `GET /articles/new` - Create new article
- `POST /articles` - Save article
- `GET /articles/:id/edit` - Edit article
- `POST /articles/:id/submit` - Submit article for review
- `GET /collections/new` - Create new collection
- `POST /collections/:id/collection_items` - Add item to collection

### Admin Routes (admin users only)

- `GET /admin` - Admin dashboard
- `GET /admin/articles` - All articles with management controls
- `POST /admin/articles/:id/approve` - Approve & publish
- `POST /admin/articles/:id/publish` - Publish article
- `POST /admin/articles/:id/unpublish` - Unpublish article

## Database Schema

### Users

- email, encrypted_password (Devise)
- username (unique)
- bio, company, position
- website, twitter, linkedin, github, instagram
- admin (boolean)
- avatar (ActiveStorage)

### Articles

- user_id, title, slug
- status (enum: draft, submitted, published)
- published_at, approved_by_id
- body (ActionText RichText)
- cover_image (ActiveStorage)
- tags (via Gutentag)

### Collections

- user_id, title, slug, description
- cover_image (ActiveStorage)
- tags (via Gutentag)

### CollectionItems

- collection_id, item_type, title
- url, content, position
- file (ActiveStorage)

### Follows

- follower_id (User)
- followable_type, followable_id (polymorphic)

## Authorization Rules (Pundit)

### Articles

- Anyone can view published articles
- Authors can create, edit, delete their own articles
- Authors can submit drafts for review
- Admins can approve, publish, unpublish any article

### Collections

- Anyone can view collections
- Authors can create, edit, delete their own collections
- Authors can add/remove items from their collections
- Admins can manage any collection

## Future Enhancements

- [ ] Add Stimulus controllers for drag-and-drop collection items
- [ ] Implement search functionality
- [ ] Add notifications for follows, approvals
- [ ] RSS feeds for articles
- [ ] Email notifications
- [ ] Image optimization and variants
- [ ] Comments on articles
- [ ] Like/favorite system
- [ ] User dashboards
- [ ] Collection sharing and collaboration

## Development

### Running Tests

```bash
rails test
```

### Code Quality

```bash
# Rubocop (linting)
bundle exec rubocop

# Brakeman (security scanning)
bundle exec brakeman

# Bundler Audit (dependency security)
bundle exec bundler-audit
```

## Deployment

The app is containerized and can be deployed with:

```bash
# Using Kamal (included)
kamal deploy

# Or Docker
docker build -t layer_zero .
docker run -p 3000:3000 layer_zero
```

## License

This project is available as open source.
