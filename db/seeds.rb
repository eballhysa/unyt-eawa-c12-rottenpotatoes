# Seed the RottenPotatoes DB with some movies.
more_movies = [
  {title: 'Aladdin', rating: 'G', release_date: '25-Nov-1992'},
  {title: 'When Harry Met Sally', rating: 'R', release_date: '21-Jul-1989'},
  {title: 'The Help', rating: 'PG-13', release_date: '10-Aug-2011'},
  {title: 'Raiders of the Lost Ark', rating: 'PG', release_date: '12-Jun-1981'},
  {title: 'Inception', rating: 'PG-13', release_date: '8-Jul-2010'},
  {title: 'The imitation game', rating: 'PG-13', release_date: '29-Aug-2014'},
  {title: 'Trolls', rating: 'PG', release_date: '8-Oct-2016'},
  {title: 'Shrek', rating: 'PG', release_date: '22-Apr-2001'},
  {title: 'Lincoln', rating: 'PG-13', release_date: '23-May-2013'},
  {title: 'Inglourious Basterds', rating: 'R', release_date: '20-May-2009'}
]

more_movies.each do |movie|
  Movie.create!(movie)
end

[
  {email: 'ballhysa@hotmail.com', password: 'Test1234', name: 'Elton', surname: 'Ballhysa'},
    {email: 'jane.doe@rottenpotatoes.com', password: 'Test1234', name: 'Jane', surname: 'Doe'}
].each {|mg| Moviegoer.create! mg}

20.times do |i|
  mg = {email: "test#{i+1}@gmail.com", password: 'Test1234', name: "Test#{i+1}", surname: "Test#{i+1}"}
  Moviegoer.create! mg
end

m1 = Movie.find_by_title 'Inglourious Basterds'
m2 = Movie.find_by_title 'Lincoln'
m3 = Movie.find_by_title 'Aladdin'

u1 = Moviegoer.find_by_email 'ballhysa@hotmail.com'
u2 = Moviegoer.find_by_email 'jane.doe@rottenpotatoes.com'
u3 = Moviegoer.find_by_email 'test1@gmail.com'

m1.reviews.create! potatoes: 5, comments: 'Dazzling performance from Cristoph Waltz', moviegoer_id: u1.id
m2.reviews.create! potatoes: 5, comments: '3rd Oscar for Daniel Day-Lewis', moviegoer_id: u2.id
m3.reviews.create! potatoes: 2, comments: 'Barely watchable', moviegoer_id: u3.id
