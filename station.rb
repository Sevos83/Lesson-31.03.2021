class Station
  attr_reader :name, :trains
#Имеет название, которое указывается при ее создании
  def initialize(name)
    @name = name
    @trains = []
  end
#Может принимать поезда (по одному за раз)
  def get_train(train)
    @trains << train
  end
#Может возвращать список всех поездов на станции,
#находящиеся в текущий момент
#Может отправлять поезда (по одному за раз, при этом,
#поезд удаляется из списка поездов, находящихся на станции).
  def send_train(train)
    @trains.delete(train)
  end
#Может возвращать список поездов на станции по типу (см. ниже):
#кол-во грузовых, пассажирских
  def trains_by_type(type)
    @trains.filter { |train| train.type == type }
  end
end
