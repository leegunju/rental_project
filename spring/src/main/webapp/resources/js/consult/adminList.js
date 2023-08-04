// JavaScript (with jQuery)
function showConfirmationModal(csno) {
    Swal.fire({
        title: `상담신청번호 ${csno} 상담이 진행되었다면 확인을 눌러주세요`,
        text: "상담을 확인하시겠습니까?",
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '확인',
        cancelButtonText: '취소'
    }).then((result) => {
        if (result.isConfirmed) {
            // Send AJAX request to the server
            $.ajax({
                type: "GET",
                url: `/consult/check?csno=${csno}`,
                success: function (data) {
                    Swal.fire(
                        '진행됨!',
                        '상담이 확인되었습니다.',
                        'success'
                    ).then(() => {
                        window.location.href = "/consult/adminList";
                    });
                },
                error: function (xhr, status, error) {
                    // Handle error response (if needed)
                    Swal.fire(
                        '오류 발생!',
                        '상담을 확인하는 동안 문제가 발생했습니다. 다시 시도해주세요.',
                        'error'
                    );
                    console.error(error);
                }
            });
        }
    });
}
