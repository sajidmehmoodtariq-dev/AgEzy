/**
 * Design Export Mode
 *
 * This script is automatically injected to prepare the application for HTML-to-Figma conversion.
 * It removes all delays, animations, transitions, and dynamic (random) data,
 * snapping the UI immediately into the requested state.
 */

(function() {
    // Determine if design export mode is active via global flag or query params
    const params = new URLSearchParams(window.location.search);
    const designParam = params.get('design') || params.get('page');
    
    if (window.DESIGN_EXPORT || designParam !== null) {
        window.DESIGN_EXPORT = true;
        
        console.log('🎨 Design Export Mode Enabled');
        
        // 1. Inject CSS to disable all transitions and animations globally
        const style = document.createElement('style');
        style.innerHTML = `
            * {
                transition: none !important;
                animation: none !important;
            }
            .splash {
                display: none !important;
                opacity: 0 !important;
                visibility: hidden !important;
            }
        `;
        document.head.appendChild(style);

        // 2. Override setTimeout to execute immediately (skipping fake API delays and UI timers)
        const originalSetTimeout = window.setTimeout;
        window.setTimeout = function(callback, delay, ...args) {
            // Instantly execute the callback, effectively fast-forwarding time
            try {
                if (typeof callback === 'function') {
                    callback(...args);
                } else {
                    eval(callback);
                }
            } catch (e) {
                console.error('Error in design-export setTimeout override:', e);
            }
            return 0; // Return dummy timeout ID
        };

        // 3. Override setInterval to execute once immediately then stop
        const originalSetInterval = window.setInterval;
        window.setInterval = function(callback, delay, ...args) {
            try {
                if (typeof callback === 'function') {
                    callback(...args);
                } else {
                    eval(callback);
                }
            } catch (e) {
                console.error('Error in design-export setInterval override:', e);
            }
            return 0; // Return dummy interval ID
        };

        // 4. Override Math.random for deterministic sample data
        const pseudoRandomSequence = [0.1, 0.5, 0.8, 0.3, 0.9, 0.2, 0.6, 0.4, 0.7, 0.05];
        let prngIndex = 0;
        Math.random = function() {
            const val = pseudoRandomSequence[prngIndex];
            prngIndex = (prngIndex + 1) % pseudoRandomSequence.length;
            return val;
        };
        
        // 5. Automatic State Generator based on query string
        // Examples: ?design=loginScreen, ?design=settingsModal, ?design=sidebar-expanded
        document.addEventListener('DOMContentLoaded', () => {
            if (designParam) {
                // Try converting kebab-case to camelCase for IDs (e.g., settings-modal -> settingsModal)
                const camelId = designParam.replace(/-([a-z])/g, function (g) { return g[1].toUpperCase(); });
                
                const targets = [
                    document.getElementById(designParam),
                    document.getElementById(camelId),
                    document.querySelector('.' + designParam)
                ];

                const targetEl = targets.find(el => el !== null);

                if (targetEl) {
                    console.log('Forcing visibility for state target:', targetEl);
                    // Common UI visibility classes
                    targetEl.classList.remove('is-hidden', 'hidden', 'd-none');
                    targetEl.classList.add('is-visible', 'is-open', 'is-active', 'show', 'active');
                } else {
                    console.warn('Design target not found for:', designParam);
                }
                
                // Specific hardcoded state fixes if generic class toggles aren't enough
                if (designParam === 'loginScreen' || designParam === 'login') {
                    const onboarding = document.getElementById('onboardingScreen');
                    if(onboarding) onboarding.classList.add('is-gone');
                }
            }
        });
    }
})();
