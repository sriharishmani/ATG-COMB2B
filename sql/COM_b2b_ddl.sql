-- Developing Commerce Web Applications
-- Lab exercise setup script
-- Last modified: 10-January-2006

-- These tables are needed in addition to default tables 
drop table dynamusic_tour_concerts;
drop table dynamusic_tour_venue;
drop table dynamusic_tour_artists;
drop table dynamusic_fanclub;
drop table dynamusic_poster;
drop table dynamusic_tour;
drop table dynamusic_newsongs_playlist;
drop table dynamusic_credit_card;
drop table dynamusic_auth_pmnt;
drop table dynamusic_org_info;
drop table dynamusic_user;
drop table dynamusic_prefgenres;
drop table dynamusic_viewedartists;
drop table dynamusic_viewedsongs;
drop table dynamusic_user_playlists;
drop table dynamusic_playlist_song;
drop table dynamusic_playlist;
drop table dynamusic_venue_eventtypes;
drop table dynamusic_concert_artists;
drop table dynamusic_concert;
drop table dynamusic_venue;
drop table dynamusic_album_songs;
drop table dynamusic_classical_song;
drop table dynamusic_song;
drop table dynamusic_artist_soloist;
drop table dynamusic_artist_group_members;
drop table dynamusic_CDROM_product_OS;
drop table dynamusic_CDROM_product;
drop table dynamusic_product;
drop table dynamusic_album_product;
drop table dynamusic_artist;
drop table dynamusic_product;
drop table dynamusic_item_bought;

commit work;

CREATE TABLE dynamusic_artist (
        id                      VARCHAR(32)     not null,
        name                    VARCHAR(100)    null,
        description             LONG VARCHAR    null,
        image                   VARCHAR(32)     null,
        genre			INTEGER		null,
        artist_type		INTEGER		null,
        primary key(id)
        );

CREATE TABLE dynamusic_artist_group_members (
        artist_id               VARCHAR(32)     not null,
        member_name             VARCHAR(32)     not null,
        primary key(artist_id,member_name)
        );

CREATE INDEX dynamusic_artist_group_members_idx ON dynamusic_artist_group_members(artist_id);
        
CREATE TABLE dynamusic_artist_soloist (
	artist_id		VARCHAR(32)	not null,
	first_name		VARCHAR(100)	null,
	last_name		VARCHAR(100)	null,
	primary key(artist_id)
	);

CREATE INDEX dynamusic_artist_soloist_idx ON dynamusic_artist_soloist(artist_id);

CREATE TABLE dynamusic_song (
        id                      VARCHAR(32)     not null,
        title                   VARCHAR(100)    null,
        genre                   INTEGER         null,
        download                VARCHAR(100)    null,
--        artist                  VARCHAR(32)     null references dynamusic_artist(id),
        artist                  VARCHAR(32)     null,
        lyrics                  LONG VARCHAR    null,
        song_size		INTEGER		null,
        song_length		INTEGER		null,
        song_type		VARCHAR(20)	null,
        primary key(id)
);

CREATE TABLE dynamusic_classical_song (
        song_id                 VARCHAR(32)     not null,
        performer		VARCHAR(100)    null,
        primary key(song_id)
        );
        
CREATE TABLE dynamusic_venue (
        id                      VARCHAR(32)     not null,
        name                    VARCHAR(100)    null,
        description             LONG VARCHAR    null,
        street1                 VARCHAR(100)    null,
        street2                 VARCHAR(100)    null,
        state                   VARCHAR(32)     null,
        city                    VARCHAR(50)     null,
        zip                     VARCHAR(10)     null,
        phone			VARCHAR(20)	null,
        image                   VARCHAR(100)    null,
        url                     VARCHAR(100)    null,
        primary key(id)
);

CREATE TABLE dynamusic_venue_eventtypes (
        venue_id                VARCHAR(32)     not null,
        event_type              VARCHAR(32)     not null,
        primary key(venue_id, event_type)
);

CREATE TABLE dynamusic_concert (
        id                      VARCHAR(32)     not null,
        name                    VARCHAR(100)    null,
        description             LONG VARCHAR    null,
        venue                   VARCHAR(32)     null references dynamusic_venue(id),
        image                   VARCHAR(100)    null,
        event_date              TIMESTAMP       null,
        primary key(id)
);

CREATE TABLE dynamusic_concert_artists (
        concert_id              VARCHAR(32)     not null references dynamusic_concert(id),
--        artist_id               VARCHAR(32)     not null references dynamusic_artist(id),
        artist_id               VARCHAR(32)     not null,
        primary key(concert_id, artist_id)
);

CREATE INDEX dynamusic_concert_artists_concert_idx ON dynamusic_concert_artists(concert_id);

CREATE TABLE dynamusic_user (
        user_id                 VARCHAR(32)     not null references dps_user(id),
        info                    LONG VARCHAR    null,
        share_profile           NUMERIC(1)      null,
        CHECK (share_profile in (0, 1)),
        subscriber           NUMERIC(1)      null,
        CHECK (subscriber in (0, 1)),
        initial_download_number		INTEGER		null,
        my_download_number		INTEGER		null,
	num_orders	integer	not null,
	cum_order_amt	double precision	not null,
	avg_order_amt	double precision	not null,
	use_org_approver	numeric(1,0)	null,
	use_org_costctr	numeric(1,0)	null,
	use_org_billaddr	numeric(1,0)	null,
	use_org_shipaddr	numeric(1,0)	null,
	use_org_payment	numeric(1,0)	null,
	use_org_vendors	numeric(1,0)	null,
	use_org_purchlst	numeric(1,0)	null,
        primary key(user_id),
        check (use_org_approver in (0,1)),
	check (use_org_costctr in (0,1)),
	check (use_org_billaddr in (0,1)),
	check (use_org_shipaddr in (0,1)),
	check (use_org_payment in (0,1)),
	check (use_org_vendors in (0,1)),
	check (use_org_purchlst in (0,1))
);

CREATE INDEX dynamusic_user_user_idx ON dynamusic_user(user_id);

alter table dynamusic_user set pessimistic;


create table dynamusic_org_info (
	org_id	varchar(40)	not null,
	logo	varchar(40)	null,
	cc_auth	numeric(1,0)	null,
	invoice_auth	numeric(1,0)	null,
	store_crdt_auth	numeric(1,0)	null,
	gift_crt_auth	numeric(1,0)	null,
	use_prnt_approver	numeric(1,0)	null,
	use_prnt_costctr	numeric(1,0)	null,
	use_prnt_billaddr	numeric(1,0)	null,
	use_prnt_shipaddr	numeric(1,0)	null,
	use_prnt_payment	numeric(1,0)	null,
	use_prnt_vendors	numeric(1,0)	null,
	use_prnt_purchlst	numeric(1,0)	null
, primary key (org_id)
, foreign key (org_id) references dps_organization (org_id)
, check (cc_auth in (0,1))
, check (invoice_auth in (0,1))
, check (store_crdt_auth in (0,1))
, check (gift_crt_auth in (0,1))
, check (use_prnt_approver in (0,1))
, check (use_prnt_costctr in (0,1))
, check (use_prnt_billaddr in (0,1))
, check (use_prnt_shipaddr in (0,1))
, check (use_prnt_payment in (0,1))
, check (use_prnt_vendors in (0,1))
, check (use_prnt_purchlst in (0,1))
);

alter table dynamusic_org_info set pessimistic;

create table dynamusic_auth_pmnt (
	id	varchar(40)	not null,
	cc_auth	numeric(1,0)	null,
	invoice_auth	numeric(1,0)	null,
	store_crdt_auth	numeric(1,0)	null,
	gift_crt_auth	numeric(1,0)	null
, primary key (id)
, foreign key (id) references dps_user (id)
, check (cc_auth in (0,1))
, check (invoice_auth in (0,1))
, check (store_crdt_auth in (0,1))
, check (gift_crt_auth in (0,1)));

alter table dynamusic_auth_pmnt set pessimistic;


create table dynamusic_credit_card (
	id	varchar(40)	not null,
	cc_first_name	wvarchar(40)	null,
	cc_middle_name	wvarchar(40)	null,
	cc_last_name	wvarchar(40)	null
, primary key (id)
, foreign key (id) references dps_credit_card (id));

create index dynamusic_crcdba_idx on dynamusic_credit_card (cc_last_name);
alter table dynamusic_credit_card set pessimistic;

create table dynamusic_item_bought (
	id	varchar(40)	not null	references dps_user (id),
	sequence_num	integer	not null,
	item	varchar(40)	not null,
	primary key (id,sequence_num)
);

create index dyn_itm_bht_id_idx on dynamusic_item_bought (id);
alter table dynamusic_item_bought set pessimistic;


CREATE TABLE dynamusic_prefgenres (
        id                      VARCHAR(32)     not null references dps_user(id),
        genre                   VARCHAR(32)     not null,
        primary key(id, genre)
);

CREATE INDEX dynamusic_prefgenres_idx ON dynamusic_prefgenres(id);

CREATE TABLE dynamusic_viewedartists (
        user_id                 VARCHAR(32)     not null references dps_user(id),
--        artist_id               VARCHAR(32)     not null references dynamusic_artist(id),
        artist_id               VARCHAR(32)     not null,
        primary key(user_id, artist_id)
);

CREATE INDEX dynamusic_viewedartists_idx ON dynamusic_viewedartists(user_id);

CREATE TABLE dynamusic_viewedsongs (
        user_id                 VARCHAR(32)     not null references dps_user(id),
--        song_id               VARCHAR(32)     not null references dynamusic_song(id),
        song_id               VARCHAR(32)     not null,
        primary key(user_id, song_id)
);

CREATE INDEX dynamusic_viewedsongs_idx ON dynamusic_viewedsongs(user_id);

CREATE TABLE dynamusic_playlist (
        id                      VARCHAR(32)     not null,
        name                    VARCHAR(100)    null,
        publish                 NUMERIC(1)      null,
        description             LONG VARCHAR    null,
           CHECK (publish in (0, 1)),
        primary key(id)
);

CREATE TABLE dynamusic_playlist_song (
        pl_id                   VARCHAR(32)     not null references dynamusic_playlist(id),
        song_id                 VARCHAR(32)     not null references dynamusic_song(id),
        primary key(song_id, pl_id)
);

CREATE INDEX dynamusic_playlist_song_pl_idx ON dynamusic_playlist_song(pl_id);

CREATE TABLE dynamusic_user_playlists (
        user_id                 VARCHAR(32)     not null references dps_user(id),
        pl_id                   VARCHAR(32)     not null references dynamusic_playlist(id),
        primary key(user_id, pl_id)
);

CREATE INDEX dynamusic_user_playlists_user_idx ON dynamusic_user_playlists(user_id);

CREATE TABLE dynamusic_newsongs_playlist (
        user_id                 VARCHAR(32)     not null references dps_user(id),
        newsongs_playlist       LONG VARCHAR    null,
        newsongs_auto_update    NUMERIC(1)      null,
        primary key(user_id)
);

CREATE TABLE dynamusic_tour (
     id            VARCHAR(32)     not null,
     tour_name     VARCHAR(32)     null,
     primary key(id)
);

CREATE TABLE dynamusic_poster (
     artist_id     VARCHAR(32)     not null,
     tour_id       VARCHAR(32)     not null references dynamusic_tour(id),
     poster_name   VARCHAR(32)     null,
     image         VARCHAR(32)     null,
     primary key(artist_id, tour_id)
);

CREATE TABLE dynamusic_fanclub (
     organization_id	VARCHAR(32)	not null,
     download_limit	INTEGER		not null,
     primary key(organization_id)
);

CREATE TABLE dynamusic_tour_artists (
        tour_id      VARCHAR(32)     not null references dynamusic_tour(id),
--        artist_id    VARCHAR(32)     not null references dynamusic_artist(id),
        artist_id    VARCHAR(32)     not null,
        primary key(tour_id, artist_id)
);

CREATE INDEX dynamusic_tour_artists_tour_idx ON dynamusic_tour_artists(tour_id);

CREATE TABLE dynamusic_tour_venue (
        tour_id      VARCHAR(32)     not null references dynamusic_tour(id),
        venue_id     VARCHAR(32)     not null references dynamusic_venue(id),
        primary key(tour_id, venue_id)
);

CREATE INDEX dynamusic_tour_venue_tour_idx ON dynamusic_tour_venue(tour_id);

CREATE TABLE dynamusic_tour_concerts (
        tour_id      VARCHAR(32)     not null references dynamusic_tour(id),
        date_key          VARCHAR(32)     not null,
        concert   VARCHAR(32)     not null references dynamusic_concert(id),
        primary key(tour_id, date_key)
);

CREATE TABLE dynamusic_product (
        product_id	VARCHAR(40)	NOT NULL	REFERENCES dcs_product(product_id),
        available	TINYINT		null,
        downloadable    TINYINT		null,
        PRIMARY KEY(product_id)
);

CREATE TABLE dynamusic_album_product (
        product_id	VARCHAR(40)	NOT NULL	REFERENCES dcs_product(product_id),
        album_title	VARCHAR(100)    null,
        album_length    VARCHAR(20)		null,
        artist          VARCHAR(32)     null references dynamusic_artist(id),
        release_date	TIMESTAMP	null,
        genre           INTEGER         null,
        CD_type		VARCHAR(20)	null,		
        PRIMARY KEY(product_id)
);

CREATE TABLE dynamusic_CDROM_product (
        product_id              VARCHAR(40)     not null,
        description		LONG VARCHAR	null,
        primary key(product_id)
        );
        
CREATE TABLE dynamusic_CDROM_product_OS (
        product_id      VARCHAR(40)     not null references dynamusic_CDROM_product(product_id),
        os_option	VARCHAR(100)    not null,
        primary key(product_id)
        );

CREATE TABLE dynamusic_album_songs (
        album_id                VARCHAR(32)     not null references dynamusic_album_product(product_id),
        song_list               VARCHAR(32)     not null references dynamusic_song(id),
        primary key(album_id, song_list)
);

CREATE INDEX dynamusic_album_songs_album_idx ON dynamusic_album_songs(album_id);

commit work;

