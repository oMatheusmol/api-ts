UPDATE Users
SET
    Name = ISNULL(@Name, Name),
    Email = ISNULL(@Email, Email),
    Password = ISNULL(@Password, Password),
    Username = ISNULL(@Username, Username)
WHERE
    UserID = @UserID;