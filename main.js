// 1. Tell the app where your database is
const supabaseUrl = 'YOUR_SUPABASE_URL_HERE';
const supabaseKey = 'YOUR_SUPABASE_ANON_KEY_HERE';
const supabase = supabase.createClient(supabaseUrl, supabaseKey);

// 2. The function to get information
async function getTickets() {
  const { data, error } = await supabase
    .from('tickets')
    .select('*');

  if (error) {
    console.log("Oh no! Error:", error);
  } else {
    showTickets(data);
  }
}

// 3. The function to put that info on the screen
function showTickets(tickets) {
  const container = document.getElementById('ticket-container');
  container.innerHTML = ''; // Clear the "Loading" text

  tickets.forEach(ticket => {
    const div = document.createElement('div');
    div.className = 'ticket-card';
    div.innerHTML = `<h3>${ticket.name}</h3><p>${ticket.status}</p>`;
    container.appendChild(div);
  });
}

// 4. Start the work!
getTickets();
