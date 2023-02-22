create table if not exists users
(
    id         uuid                              default gen_random_uuid() not null
        constraint users_pk primary key,
    name       varchar(255)             not null,
    login      varchar(255)             not null unique,
    email      varchar(255)             not null unique,
    password   varchar(255)             not null,
    created_at timestamp with time zone not null default now(),
    updated_at timestamp with time zone not null default now()
);

create table if not exists lists
(
    id         uuid                              default gen_random_uuid() not null
        constraint lists_pk primary key,
    user_id    uuid                     not null
        constraint lists_users_id_fk references users,
    title      varchar(255)             not null,
    created_at timestamp with time zone not null default now(),
    updated_at timestamp with time zone not null default now()
);

create table if not exists items
(
    id          uuid                              default gen_random_uuid() not null
        constraint items_pk primary key,
    list_id     uuid                     not null
        constraint items_lists_id_fk references lists,
    user_id     uuid                     not null
        constraint items_users_id_fk references users,
    item_id     uuid                     null
        constraint items_items_id_fk references items,
    title       varchar(255)             not null,
    description varchar(1000)            null,
    created_at  timestamp with time zone not null default now(),
    updated_at  timestamp with time zone not null default now()
);
