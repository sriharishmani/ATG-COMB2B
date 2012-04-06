drop table dynamusic_tour_concerts;
drop table dynamusic_tour_venue;
drop table dynamusic_tour_artists;
drop table dynamusic_fanclub;
drop table dynamusic_poster;
drop table dynamusic_tour;
drop table dynamusic_newsongs_playlist;
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
drop table dynamusic_artist_album;
drop table dynamusic_album_songs;
drop table dynamusic_album;
drop table dynamusic_classical_song;
drop table dynamusic_song;
drop table dynamusic_artist_soloist;
drop table dynamusic_artist_group_members;
drop table dynamusic_artist;

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
        
CREATE TABLE dynamusic_album (
        id                      VARCHAR(32)     not null,
        title                   VARCHAR(100)    null,
        cover                   VARCHAR(100)    null,
        artist                  VARCHAR(32)     null references dynamusic_artist(id),
--        artist                  VARCHAR(32)     null,
        published		TIMESTAMP	null,
        description             LONG VARCHAR    null,
        genre                   INTEGER         null,
        primary key(id)
);

CREATE TABLE dynamusic_album_songs (
        album_id                VARCHAR(32)     not null references dynamusic_album(id),
        song_list               VARCHAR(32)     not null references dynamusic_song(id),
        primary key(album_id, song_list)
);

CREATE INDEX dynamusic_album_songs_album_idx ON dynamusic_album_songs(album_id);

CREATE TABLE dynamusic_artist_album (
     album_id    VARCHAR(32)  not null references dynamusic_album(id),
     artist_id   VARCHAR(32)  not null,
     primary key(album_id, artist_id)
);

CREATE INDEX dynamusic_artist_album_idx ON dynamusic_artist_album(album_id);

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
        primary key(user_id)
);

CREATE INDEX dynamusic_user_user_idx ON dynamusic_user(user_id);

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

commit work;
