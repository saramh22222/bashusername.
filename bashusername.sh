#!/bin/bash

# Variables
USERNAME="sara mostafa"
GROUPNAME="helal"

# Check if the group exists
if getent group "$GROUPNAME" >/dev/null; then
    echo "Group '$GROUPNAME' already exists."
else
    echo "Creating group '$GROUPNAME'..."
    groupadd "$GROUPNAME"
    echo "Group '$GROUPNAME' created successfully."
fi

# Check if the user exists
if id -u "$USERNAME" >/dev/null 2>&1; then
    echo "User '$USERNAME' already exists."
else
    echo "Creating user '$USERNAME'..."
    useradd -m -g "$GROUPNAME" "$USERNAME"
    echo "User '$USERNAME' created successfully and added to group '$GROUPNAME'."
fi

# Add user to the group (ensure membership)
usermod -aG "$GROUPNAME" "$USERNAME"

# Display user information
echo "User information for '$USERNAME':"
id "$USERNAME"

# Display group information
echo "Group information for '$GROUPNAME':"
getent group "$GROUPNAME"
