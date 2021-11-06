SELECT 
UserID AS userID,
Name AS name,
Email AS email,
Username AS username,
Password AS password
FROM Users
WHERE UserID = @UserID;