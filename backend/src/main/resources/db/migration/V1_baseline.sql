create table users (
  id uuid primary key,
  email varchar(255) not null unique,
  password_hash varchar(255) not null,
  display_name varchar(120),
  created_at timestamp not null default now()
);

create table books (
  id uuid primary key,
  title varchar(255) not null,
  author varchar(255),
  pages int,
  cover_url text,
  created_at timestamp not null default now()
);

create table reading_progress (
  id uuid primary key,
  user_id uuid not null references users(id),
  book_id uuid not null references books(id),
  current_page int default 0,
  total_time_seconds int default 0,
  status varchar(20) not null default 'READING',
  updated_at timestamp not null default now(),
  unique(user_id, book_id)
);