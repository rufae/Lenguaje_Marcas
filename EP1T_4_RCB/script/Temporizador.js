const getRemainTime = deadline => {
    let now = new Date(),
        remainTime = (new Date(deadline) - now + 1000) / 1000;
        remainSeconds = ('0' + Math.floor(remainTime % 60)).slice(-2),
        remainMinutes = ('0' + Math.floor(remainTime / 60 % 60)).slice(-2),
        remainHours = ('0' + Math.floor(remainTime / 3600 % 24)).slice(-2),
        remainDays = Math.floor(remainTime / (3600 * 24));

    return {
        remainTime,
        remainSeconds,
        remainMinutes,
        remainHours,
        remainDays
    }
};

const formatTime = (value, unit) => {
    if (unit === 'remainHours') {
        return value > 0 ? `${value}h ` : '';
    } else if (unit === 'remainMinutes') {
        return value > 0 ? `${value}' ` : '';
    } else if (unit === 'remainSeconds') {
        return value > 0 ? `${value}'' ` : '';
    }
};

const countdown = (deadline, elem, finalMessage, units) => {
    const el = document.getElementById(elem);

    const timerUpdate = setInterval(() => {
        let t = getRemainTime(deadline);

        let displayString = "";
        units.forEach((unit, index) => {
            if (unit === 'remainDays') {
                let dayLabel = (t[unit] <= 1) ? 'Día' : 'Días';
                displayString += `${t[unit]} ${dayLabel} `;
            } else {
                let separator = (index < units.length - 1) ? ' ' : '';
                displayString += formatTime(t[unit], unit) + separator;
            }
        });

        el.innerHTML = displayString.trim();

        if (t.remainTime <= 1) {
            clearInterval(timerUpdate);
            el.innerHTML = finalMessage;
        }
    }, 1000);
};

countdown('Nov 30 2023 00:00:00 GMT+0100', 'days', '', ['remainDays']);
countdown('Nov 30 2023 00:00:00 GMT+0100', 'hours-minutes-seconds', '', ['remainHours', 'remainMinutes', 'remainSeconds']);
