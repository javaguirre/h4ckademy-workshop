package lib

type Persistence interface {
	Save()
}

type Analytics interface {
	Update()
}

type PersistService struct {
	databaseName string
}

type AnalyticsService struct {
	apiKey    string
	widgetKey string
}

func NewPersistService() *PersistService {
	return &PersistService{}
}

func (service *PersistService) Save(message string) {
	// TODO
}

func NewAnalyticsService() *AnalyticsService {
	return &AnalyticsService{}
}

func (service *AnalyticsService) Update(message string) {
	// TODO: Send to our analytics service
}
