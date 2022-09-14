Select *
From PortfolioProject..CovidDeaths
order by 3, 4


Select Location, date, total_cases, , new_cases, total_deaths, population
From PortfolioProject..CovidDeaths
order by 1, 2


--Total Cases vs Total Deaths
-- Shows the likelyhood of dying if you contract Covid in Canada

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
Where Location = 'Canada'
order by 1, 2



--Total Cases vs Population
-- Shows what percentage of population got Covid in Canada

Select Location, date, population, total_cases,  (total_cases/population)*100 as InfectionPercentage
From PortfolioProject..CovidDeaths
Where Location = 'Canada'
order by 1, 2



-- Countries with highest infection rate compared to population

Select Location, population, MAX(total_cases) as HighestInfectionCount,  MAX((total_cases/population))*100 as InfectionPercentage
From PortfolioProject..CovidDeaths
Group by Location, population
order by InfectionPercentage desc



-- Countries with the highest death count per population

Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is not NULL
Group by Location
order by TotalDeathCount desc



-- Total death count by continent

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is not NULL
Group by continent
order by TotalDeathCount desc



-- Global Numbers: total cases, total deaths, and death percentage

Select date, SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
Where continent is not NULL
Group By date
order by 1, 2

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
Where continent is not NULL
order by 1, 2



