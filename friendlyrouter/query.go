package friendlyrouter

import (
	"github.com/aws/aws-sdk-go/aws"
	// "github.com/aws/aws-sdk-go/service/dynamodb"
)

type CPU struct {
	model string
	architecture string
	frequency int
	core int
}

type RAM struct {
	min int
	max int
	buildin int
}

type Power struct {
	min int
	max int
}

type Hardware struct {
	cpu CPU
	ram RAM
	power Power
}

type Location struct {
	country string
	city string
	address string
}

type Links struct {
	website string
	twitter string
	linkeding string
	facebook string
	google string
}

type Reseller struct {
	name string
	location Location
	links Links
}

type Manufacturer struct {
	name string
	location Location
	links Links
}

type Document struct {
	version int
	date string
	routername string
	routerid string
	resources []string
	hardware Hardware
	manufacturer Manufacturer
	reseller Reseller
}

func RouterName(name string) *string {
	return aws.String(name)
}

func RouterId(id string) *string {
	return aws.String(id)
}

func RouterLink(link string) *string {
	return aws.String(link)
}

func CreateDocument(d Document) {
}



