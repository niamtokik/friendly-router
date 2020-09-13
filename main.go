package main

import (
	"net/http"
	"github.com/niamtokik/friendly-router/friendlyrouter"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/dynamodb" 
)

// return the name of the table used for the main database
// see https://docs.aws.amazon.com/sdk-for-go/api/aws/#String
func TableName() *string {
	return aws.String("FriendlyRouter")
}

// return the attribute definition
// see https://docs.aws.amazon.com/sdk-for-go/api/service/dynamodb/#AttributeDefinition
func TableIndex() []*dynamodb.AttributeDefinition{
	return []*dynamodb.AttributeDefinition{
		{
			AttributeName: aws.String("RouterName"),
			AttributeType: aws.String("S"),
		},
	}
}

// return the key schema element
// see https://docs.aws.amazon.com/sdk-for-go/api/service/dynamodb/#KeySchemaElement
func KeySchema() []*dynamodb.KeySchemaElement {
	return []*dynamodb.KeySchemaElement{
		{
			AttributeName: aws.String("RouterName"),
			KeyType:       aws.String("HASH"),
		},
	}
}

// return create table input for creating database
// see https://docs.aws.amazon.com/sdk-for-go/api/service/dynamodb/#CreateTableInput
func inputDatabase() *dynamodb.CreateTableInput {
	input := &dynamodb.CreateTableInput{
		AttributeDefinitions: TableIndex(),
		KeySchema: KeySchema(),
		ProvisionedThroughput: &dynamodb.ProvisionedThroughput{
			ReadCapacityUnits:  aws.Int64(5),
			WriteCapacityUnits: aws.Int64(5),
		},
		TableName: TableName(),
	}
	return input
}

// create database
func createDatabase(client *dynamodb.DynamoDB) {
	client.CreateTable(inputDatabase())
}

// check the state of the database
func checkDatabase(client *dynamodb.DynamoDB) {
	createDatabase(client)
}



// main function
func main() {
	mux := http.NewServeMux()
	friendlyrouter.Route(mux)

	session := session.Must(session.NewSession())
	client := dynamodb.New(session)

	checkDatabase(client)
	
	server := &http.Server{
		Addr: "0.0.0.0:8080",
		Handler: mux,
	}
	
	server.ListenAndServe()
}
