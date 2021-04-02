class Train
  attr_reader :number, :type, :route, :current_station
#Имеет номер (произвольная строка) и тип (грузовой, пассажирский)
#количество вагонов, эти данные указываются при создании экземпляра класса
  def initialize(number, type, carriages)
    @number = 10
    @type = type
    @carriages = carriages
    @speed = 0
  end
#Может набирать скорость
#Может возвращать текущую скорость
  def speed_up(speed)
    @speed += speed
  end

  def speed_down(speed)
    @speed -= speed
    @speed = @speed > 0 ? @speed : stop
  end
#Может тормозить (сбрасывать скорость до нуля)
  def stop
    @speed = 0
  end
#Может возвращать количество вагонов
  def add_carriages
    @carriages += 1 if @speed == 0
  end
#Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов).
#Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
  def delete_carriages
    @carriages -= 1 if @speed == 0 && carriages > 0
  end
#Может принимать маршрут следования (объект класса Route).
#При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
  def route=(route)
    @route = route
    @current_station = @route.stations.first
    @current_station_index = @route.stations.index(@current_station)
    @current_station.train_in(self)
  end
#Может перемещаться между станциями, указанными в маршруте.
#Перемещение возможно вперед и назад, но только на 1 станцию за раз.
  def next_station
    @route.stations[@current_station_index + 1] if if @route.stations[@current_station_index] != @route.stations.last
  end

  def move_next_station
    return unless next_station
    @current_station.train_out(self)
    next_station.train_in(self)
    @current_station_index += 1
    @current_station = @route.stations[@current_station_index]
  end

  def previous_station
     @route.stations[@current_station_index - 1] if @route.stations[@current_station_index] != @route.stations.first
  end

  def move_previous_station
    return unless previous_station
    @current_station.train_out(self)
    previous_station.train_in(self)
    @current_station_index -= 1
    @current_station = @route.stations[@current_station_index
  end
end
