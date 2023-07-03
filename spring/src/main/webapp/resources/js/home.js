function toggleTooltip() {
    var tooltip = document.getElementById("tooltip");
    tooltip.style.display = tooltip.style.display === "block" ? "none" : "block";
}

document.getElementById('search').addEventListener('click', function() {
    var searchInput = document.getElementById('search-input');
    if (searchInput.style.width !== '200px') { 
        searchInput.style.width = '200px'; 
        searchInput.style.display = 'block';
    } else {
        searchInput.style.width = '0';
        searchInput.style.display = 'none';
    }
});