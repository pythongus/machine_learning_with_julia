using CSV
using DataFrames
using Test

function load_data() 
    return CSV.read("gapminder.csv")
end

function datainfo(dataset)
    println(summary(dataset))
    println(first(dataset))
    println(describe(dataset))
    println(size(dataset))
end

function gapminder2007(dataset)
    year_2007 = dataset |> (x) -> x.year .== 2007;
    dataset_2007 = dataset[year_2007, :]
    dataset_2007.gdp = dataset_2007.pop .* dataset_2007.gdpPercap / 1_000_000_000
    print(summary(dataset_2007))
    
    first(sort(dataset_2007, :gdp, rev=true), 5)
    last(sort(dataset_2007, :gdp, rev=true), 5)
    first(sort(dataset_2007, :pop, rev=true), 10)[:, :pop] / 1_000_000
    dataset_2007.pop = dataset_2007.pop / 1_000_000
    return dataset_2007
end


function add_dummy_column(column, value)
    return column == value ? 1 : 0
end

@test add_dummy_column("Asia", "Americas") == 0
@test add_dummy_column("Asia", "Asia") == 1

function create_dummy_continents(dataset)
    data = copy(dataset)
    continents = unique(data.continent)
    for continent in continents[1:end - 1]
        insertcols!(data,
                    size(data)[2] + 1,
                    Symbol(continent) => map((value) -> add_dummy_column(continent, value), data.continent))
    end
    return deletecols!(data, [:year, :continent])
end

function create2007data() 
   return load_data() |> gapminder2007 |> create_dummy_continents
end