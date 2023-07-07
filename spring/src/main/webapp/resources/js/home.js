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

document.addEventListener("DOMContentLoaded", function() {
  // 정보 버튼(info-button) 클릭 시 동작
    document.getElementById("info-button").addEventListener("click", function() {
    var infoModal = document.getElementById("info-modal");
    infoModal.style.display = "block";
    infoModal.style.width = "0px";
    infoModal.style.height = "0px";
    infoModal.animate([
      { width: "0px", height: "0px" },
      { width: "260px", height: "550px", opacity: 1 }
    ], {
      duration: 500,
      fill: "forwards"
    });
  });

  // 정보 모달(info-modal) 닫기 버튼(close-button) 클릭 시 동작
  document.getElementById("close-button").addEventListener("click", function() {
    var infoModal = document.getElementById("info-modal");
    infoModal.animate([
      { width: "260px", height: "550px", opacity: 1 },
      { width: "0px", height: "0px", opacity: 0 }
    ], {
      duration: 1500,
      fill: "forwards"
    }).onfinish = function() {
      infoModal.style.display = "none";
    };
  });

  // 관리자 버튼(admin-button-left) 클릭 시 동작
  document.getElementById("admin-button-left").addEventListener("click", function() {
    var adminModal = document.getElementById("admin-modal-left");
    adminModal.style.display = "block";
    adminModal.style.width = "0px";
    adminModal.style.height = "0px";
    adminModal.animate([
      { width: "0px", height: "0px" },
      { width: "260px", height: "550px", opacity: 1 }
    ], {
      duration: 500,
      fill: "forwards"
    });
  });

  // 관리자 모달(admin-modal-left) 닫기 버튼(close-button-admin-left) 클릭 시 동작
  document.getElementById("close-button-admin-left").addEventListener("click", function() {
    var adminModal = document.getElementById("admin-modal-left");
    adminModal.animate([
      { width: "260px", height: "550px", opacity: 1 },
      { width: "0px", height: "0px", opacity: 0 }
    ], {
      duration: 1500,
      fill: "forwards"
    }).onfinish = function() {
      adminModal.style.display = "none";
    };
  });
});