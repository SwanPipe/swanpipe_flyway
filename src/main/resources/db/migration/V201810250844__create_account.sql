/*
 Accounts simply tie together logins and personas.
 Each account can have multiple logins (a team of people
 under one account) and each account can have multiple
 personas (multiple personalities).
 */
create table account (
  id serial primary key,
  enabled boolean default true
);

/*
 Logins allow a team of people to use one account.
 Each login id must be unique system wide.
 */
create table login (
  id text not null primary key,
  account_id integer not null references account( id ),
  password text not null,
  enabled boolean default true,
  last_successful_login timestamp,
  last_failed_login timestamp
);

/*
 A persona is the public name and address.
 Each persona must be unique system wide. Nearly everything
 else hangs off of a persona.
 */
create table persona (
  id text not null primary key,
  account_id integer not null references account( id ),
  display_name text
);
