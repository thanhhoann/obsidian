-- Table to store user information
CREATE TABLE User (
    - [ ] id UUID PRIMARY KEY, -- Unique identifier for each user
    avatar_url VARCHAR(255), -- URL to the user's avatar image
    email VARCHAR(255) NOT NULL, -- User's email address
    password VARCHAR(255) NOT NULL, -- User's password
    full_name VARCHAR(255), -- User's full name
    user_name VARCHAR(255) UNIQUE NOT NULL, -- Unique username for the user
    bio TEXT, -- User's biography
    is_active BOOLEAN DEFAULT FALSE, -- Indicates if the user account is active
    privacy_mode VARCHAR(7) DEFAULT 'PUBLIC', -- User's privacy mode (e.g., PUBLIC or PRIVATE)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the user was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp when the user was last updated
);

-- Table to store follow relationships between users
CREATE TABLE Follow (
    id UUID PRIMARY KEY, -- Unique identifier for each follow relationship
    follower_id UUID NOT NULL, -- ID of the user who is following
    followee_id UUID NOT NULL, -- ID of the user being followed
    followed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the follow relationship was created
    request_status VARCHAR(8) NOT NULL, -- Status of the follow request (e.g., PENDING, ACCEPTED)
    UNIQUE (follower_id, followee_id), -- Ensures a user cannot follow another user more than once
    FOREIGN KEY (follower_id) REFERENCES User(id), -- Foreign key to the follower user
    FOREIGN KEY (followee_id) REFERENCES User(id) -- Foreign key to the followee user
);

-- Table to store posts created by users
CREATE TABLE Post (
    id UUID PRIMARY KEY, -- Unique identifier for each post
    content TEXT NOT NULL, -- Content of the post
    no_shares INT DEFAULT 0, -- Number of times the post has been shared
    user_id UUID NOT NULL, -- ID of the user who created the post
    visibility VARCHAR(12) DEFAULT 'PUBLIC', -- Visibility of the post (e.g., PUBLIC, PRIVATE)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the post was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the post was last updated
    FOREIGN KEY (user_id) REFERENCES User(id) -- Foreign key to the user who created the post
);

-- Table to store tags on posts
CREATE TABLE Tag (
    id UUID PRIMARY KEY, -- Unique identifier for each tag
    tagger_id UUID NOT NULL, -- ID of the user who tagged
    tagged_id UUID NOT NULL, -- ID of the user being tagged
    post_id UUID NOT NULL, -- ID of the post being tagged
    FOREIGN KEY (tagger_id) REFERENCES User(id), -- Foreign key to the user who tagged
    FOREIGN KEY (tagged_id) REFERENCES User(id), -- Foreign key to the user being tagged
    FOREIGN KEY (post_id) REFERENCES Post(id) -- Foreign key to the post being tagged
);

-- Table to store comments on posts
CREATE TABLE Comment (
    id UUID PRIMARY KEY, -- Unique identifier for each comment
    content TEXT NOT NULL, -- Content of the comment
    user_id UUID NOT NULL, -- ID of the user who created the comment
    post_id UUID NOT NULL, -- ID of the post being commented on
    parent_id UUID, -- ID of the parent comment (for nested comments)
    level INT DEFAULT 0, -- Level of the comment (for nested comments)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the comment was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the comment was last updated
    FOREIGN KEY (user_id) REFERENCES User(id), -- Foreign key to the user who created the comment
    FOREIGN KEY (post_id) REFERENCES Post(id) -- Foreign key to the post being commented on
);

-- Table to store attachments to posts or comments
CREATE TABLE Attachment (
    id UUID PRIMARY KEY, -- Unique identifier for each attachment
    content_type VARCHAR(7) NOT NULL, -- Type of content the attachment is associated with (e.g., POST, COMMENT)
    content_id UUID NOT NULL, -- ID of the content the attachment is associated with
    url VARCHAR(255) NOT NULL, -- URL to the attachment
    type VARCHAR(5) NOT NULL, -- Type of the attachment (e.g., IMAGE, VIDEO)
    format VARCHAR(4) NOT NULL, -- Format of the attachment (e.g., JPG, MP4)
    sound_duration VARCHAR(10), -- Duration of the sound (if applicable)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the attachment was created
    FOREIGN KEY (content_id) REFERENCES Post(id), -- Foreign key to the post (if applicable)
    FOREIGN KEY (content_id) REFERENCES Comment(id) -- Foreign key to the comment (if applicable)
);

-- Table to store reactions to posts or comments
CREATE TABLE Reaction (
    id UUID PRIMARY KEY, -- Unique identifier for each reaction
    user_id UUID NOT NULL, -- ID of the user who reacted
    content_type VARCHAR(7) NOT NULL, -- Type of content the reaction is associated with (e.g., POST, COMMENT)
    content_id UUID NOT NULL, -- ID of the content the reaction is associated with
    type VARCHAR(7) NOT NULL, -- Type of the reaction (e.g., LIKE, LOVE)
    is_deleted BOOLEAN DEFAULT FALSE, -- Indicates if the reaction has been deleted
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the reaction was created
    FOREIGN KEY (user_id) REFERENCES User(id), -- Foreign key to the user who reacted
    FOREIGN KEY (content_id) REFERENCES Post(id), -- Foreign key to the post (if applicable)
    FOREIGN KEY (content_id) REFERENCES Comment(id) -- Foreign key to the comment (if applicable)
);

-- Table to store notifications for users
CREATE TABLE Notification (
    id UUID PRIMARY KEY, -- Unique identifier for each notification
    receiver_id UUID NOT NULL, -- ID of the user receiving the notification
    sender_id UUID NOT NULL, -- ID of the user sending the notification
    post_id UUID, -- ID of the post associated with the notification (if applicable)
    comment_id UUID, -- ID of the comment associated with the notification (if applicable)
    reaction_id UUID, -- ID of the reaction associated with the notification (if applicable)
    tag_id UUID, -- ID of the tag associated with the notification (if applicable)
    type VARCHAR(13) NOT NULL, -- Type of the notification (e.g., FOLLOW, LIKE, COMMENT)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the notification was created
    is_read BOOLEAN DEFAULT FALSE, -- Indicates if the notification has been read
    FOREIGN KEY (receiver_id) REFERENCES User(id), -- Foreign key to the user receiving the notification
    FOREIGN KEY (sender_id) REFERENCES User(id), -- Foreign key to the user sending the notification
    FOREIGN KEY (post_id) REFERENCES Post(id), -- Foreign key to the post (if applicable)
    FOREIGN KEY (comment_id) REFERENCES Comment(id), -- Foreign key to the comment (if applicable)
    FOREIGN KEY (reaction_id) REFERENCES Reaction(id), -- Foreign key to the reaction (if applicable)
    FOREIGN KEY (tag_id) REFERENCES Tag(id) -- Foreign key to the tag (if applicable)
);


