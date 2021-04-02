class Route
  attr_reader :stations
#Имеет начальную и конечную станцию,
#список промежуточных станций. добавлять промежуточную станцию в список
#Начальная и конечная станции указываютсся при создании маршрута,
#а промежуточные могут добавляться между ними
  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
#удалять промежуточную станцию из списка
  def delete_station(station)
    if (station != @stations.first) && (station != @stations.last)
    @stations.delete(station)
  end
#список всех станций по-порядку от начальной до конечной
  def add_station(station)
    @stations.insert(-2, station)
  end
end
