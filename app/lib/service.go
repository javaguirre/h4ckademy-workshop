package lib

type Persistence interface {
	Save()
}

type Analytics interface {
	Update()
}

type PersistService struct {
	string databaseName
}

type AnalyticsService struct {
	string apiKey
	string widgetKey
}

func (service *PersistService) New() int {
	return PersistService{}
}

func (service *PersistService) Save() int {
	service.save()
}

func (service *AnalyticsService) New() int {
	return AnalyticsService{}
}

func (service *AnalyticsService) Update() int {
	// TODO: Send to our analytics service
}
